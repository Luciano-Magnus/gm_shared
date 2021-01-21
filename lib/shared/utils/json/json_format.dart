class JsonFormat{
  static String format(String json,{int length}){
    if(length == null){
      length = json.length - 266;
    }
    return json.substring(0, length);
  }
}