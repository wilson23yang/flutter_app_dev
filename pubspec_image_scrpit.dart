import 'dart:io';

import 'package:sprintf/sprintf.dart';

void main() {
  ///
  String yamlFilePath = Directory.current.path + '/pubspec.yaml';
  File yamlFile = File(yamlFilePath);
  if (!yamlFile.existsSync()) {
    return;
  }

  String dir2x = Directory.current.path + '/images/2.0x/';
  String dir3x = Directory.current.path + '/images/3.0x/';

  List<String> dir2xNames = <String>[];
  List<String> dir3xNames = <String>[];
  Directory(dir2x).listSync().forEach((element) {
    dir2xNames.add('   - images' + element.path.substring(element.path.lastIndexOf('/')));
  });
  Directory(dir3x).listSync().forEach((element) {
    dir3xNames.add('   - images' + element.path.substring(element.path.lastIndexOf('/')));
  });

  List<String> yamlFileLines = yamlFile.readAsLinesSync();
  List<String> yamlImages = <String>[];
  List<String> unavailYamlImages = <String>[];
  yamlFileLines.forEach((line){
    if(line.contains('- images/') && (!line.contains('#') || (line.contains('#') && line.indexOf('#') > line.indexOf('- images/')))){
      yamlImages.add(line);
    } else if(line.contains('- images/') && ((line.contains('#') && line.indexOf('#') < line.indexOf('- images/')))){
      unavailYamlImages.add(line);
    }
  });

  int lastImageIndexInYaml = yamlFileLines.length - 1;
  if(yamlImages != null && yamlImages.length > 0){
    lastImageIndexInYaml = yamlFileLines.indexOf(yamlImages.last);
  }


  Set<String> newImages2x = dir2xNames.toSet().difference(yamlImages.toSet());
  Set<String> newImages3x = dir3xNames.toSet().difference(yamlImages.toSet());
  Set<String> newImages = newImages2x.union(newImages3x);//并集
  Set<String> only2x = dir2xNames.toSet().difference(dir3xNames.toSet());
  Set<String> only3x = dir3xNames.toSet().difference(dir2xNames.toSet());

  newImages = newImages.difference(unavailYamlImages.toSet());
  if(newImages != null && newImages.length > 0){
    DateTime now = DateTime.now();
    yamlFileLines.insert(++lastImageIndexInYaml, sprintf('\n   # insert Date:%d-%d-%d %d:%d\n',[now.year,now.month,now.day,now.hour,now.minute]));
  }
  newImages.forEach((line){
    yamlFileLines.insert(++lastImageIndexInYaml, line);
  });
  print('\n\n');
  if(yamlFileLines != null && only2x != null){
    List<String> temp = only2x.toList();
    for(int i =0;i<yamlFileLines.length;i++){
      for(int j = 0;j<temp.length;j++){
        if(yamlFileLines[i].trim().isNotEmpty && temp[j].trim().contains(yamlFileLines[i].replaceAll('# only', '').trim()) && !yamlFileLines[i].contains('# only')){
          print(_formatString(yamlFileLines[i]) + "\t\t\t# only add 2.0x");
        }
      }
    }
  }

  if(yamlFileLines != null && only3x != null){
    List<String> temp = only3x.toList();
    for(int i =0;i<yamlFileLines.length;i++){
      for(int j=0;j<temp.length;j++){
        if(yamlFileLines[i].trim().isNotEmpty && temp[j].trim().contains(yamlFileLines[i].replaceAll('# only', '').trim()) && !yamlFileLines[i].contains('# only')){
          print(_formatString(yamlFileLines[i]) + "\t\t\t# only add 3.0x");
        }
      }
    }
  }

  RandomAccessFile raf = yamlFile.openSync(mode: FileMode.write);
  for(int i = 0;i<yamlFileLines.length;i++){
    raf.writeStringSync(yamlFileLines[i]);
    raf.writeStringSync('\n');
  }
  raf.closeSync();
}

///
String _formatString(String s){
  if(s==null || s.isEmpty || s.length > 50){
    return s;
  }
  int len = 50-s.length;
  for(int i=0;i<len;i++){
    s = s+' ';
  }
  return s;
}
