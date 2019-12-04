
import 'dart:io';
import 'package:sprintf/sprintf.dart';

void main(){
  _buildColor(
    lines: _getFromFile(path: '${Directory.current.path}/lib/res/colors/color_theme.dart'),
    lightFilePath: '${Directory.current.path}/lib/res/colors/auto_create/color_light.dart',
    darkFilePath: '${Directory.current.path}/lib/res/colors/auto_create/color_dark.dart',
  );
}

///
///
/// 
void _buildColor({List<String> lines,String lightFilePath,String darkFilePath}){
  _writeDartFile(lines, lightFilePath,'ColorLight','light');
  _writeDartFile(lines, darkFilePath,'ColorDark','dark');
}


void _writeDartFile(List<String> lines,String path,String className,[String type = 'light']) async {
  File file = File(path);
  if(!file.existsSync()){
    file.createSync();
  }
  StringBuffer buffer = StringBuffer();
  buffer
    ..writeln("import 'package:flutter/material.dart';")
    //..writeln("import 'package:bnb_wallet/res/colors/color_d.dart';")
    ..writeln()
    ..writeln('///')
    ..writeln('///')
    ..writeln('///  * 通过script.dart自动生成，请不要手动编辑 *')
    ..writeln('///')
    ..writeln('///')
    ..writeln()
    ..writeln(sprintf("class %s {",[className]))
    ..writeln()
    ..writeln("\tstatic Map<String, Color> colorSet = <String, Color>{");

  if(lines != null && lines.length > 0){
    for(int i = 0;i<lines.length;i++){
      if(lines[i].contains('//') && !lines[i].contains(';')){
        //buffer.writeln('\t\t${lines[i].trim()}');
      } else if(lines[i].contains('Color') && lines[i].contains('get')){
        buffer.write('\t\t');
        List<String> subLines = lines[i].substring(lines[i].indexOf('('),lines[i].lastIndexOf(')')+2).split(',');
        for(int j = 0;j<subLines.length;j++){
          if(subLines[j].contains('key')){
            buffer..write(subLines[j].substring(subLines[j].indexOf("'"),subLines[j].lastIndexOf("'")+1))
              ..write(': ');
          } else if(subLines[j].contains('light') && type == 'light'){
            buffer..write(subLines[j].trim().substring(5).replaceAll(':', '').trim())..writeln(',');
          } else if(subLines[j].contains('dark') && type == 'dark'){
            buffer..write(subLines[j].trim().substring(4).replaceAll(':', '').replaceAll(");", "").trim())..writeln(',');
          }
        }
      }
    }
  }
  buffer..writeln('\t};');
  buffer..writeln('}');
  print(buffer.toString());
  file.writeAsStringSync(buffer.toString(),mode: FileMode.write);
  
}

///
List<String> _getFromFile({String path}){
  File file = File(path);
  List<String> newLines = <String>[];
  List<String> lines = file.readAsLinesSync();
  StringBuffer combineLine = StringBuffer();
  for(int i = 0;i<lines.length;i++){
    String currentLine = lines[i].contains('//')?lines[i].substring(0,lines[i].indexOf('//')):lines[i];
    if(currentLine.contains('Color') && currentLine.contains(' get ') && currentLine.contains(' => ')){
      combineLine.write(currentLine.trim());
    } else if(combineLine.toString().isNotEmpty){
      combineLine.write(currentLine.trim());
    }
    if(combineLine.toString().contains(';')){
      newLines.add(combineLine.toString());
      combineLine.clear();
    }
  }
  print(newLines.toString().replaceAll(';,', '\n'));
  return newLines;
}

