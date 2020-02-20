class Validation{
  String validateName(String value){
    if(value.isEmpty){
      return 'Nama harus diisi';
    }
    return null;
  }

  String validateEmail(String value){
    if(! value.contains('@')){
      return 'Email tidak valid';
    }
    return null;
  }

  String validatePassword(String value){
    if(value.length < 4){
      return 'Password diatas 4';
    }
    return null;
  }
}