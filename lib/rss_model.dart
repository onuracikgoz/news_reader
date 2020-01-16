

class Feeds {
  String _title, _description, _imgUrl, _webLink;

  Feeds(this._title, this._description, this._webLink,this._imgUrl);



get getTitle => _title;

  set setTitle(value) {
    _title = value;
  }

  get getUrlImg => _imgUrl;

  set setUrlImg(value) {
    _imgUrl = value;
  }

  get getDescription {




    if(_description.contains("alt="))
      {
        List splitDescription = _description.split("alt=");


        return splitDescription[1].replaceAll("<br />"," ").replaceAll("/>"," ").substring(1,100) + "...";
      }
else {
  return _description.substring(1,60) + "...";
}

  }

  set setDescription(value) {
    _description = value;
  }

  get getWebLink => _webLink;
  set setWebLink (value){
    _webLink=value;

  }
}


