class PaymentCard {
  PaymentCard({
    required this.cardHolder,
    required this.cardNo,
    required this.cvv,
    required this.expMonth,
    required this.expYear,
    required this.title,
  });


  late final String cardHolder;
  late final String cardNo;
  late final String cvv;
  late final String expMonth;
  late final String expYear;
  late final String title;
  
  PaymentCard.fromJson(Map<String, dynamic> json){
    cardHolder = json['cardHolder'];
    cardNo = json['cardNo'];
    cvv = json['cvv'];
    expMonth = json['expMonth'];
    expYear = json['expYear'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cardHolder'] = cardHolder;
    _data['cardNo'] = cardNo;
    _data['cvv'] = cvv;
    _data['expMonth'] = expMonth;
    _data['expYear'] = expYear;
    _data['title'] = title;
    return _data;
  }
}


/*{
  "id": 1,
  "uuid":"77d5947f-d930-3932-85eb-768b24c055c2",
  "firstname":"Davin",
  "lastname":"Jacobi",
  "username":"dudley67",
  "password":"N>hu>p",
  "email":"addison.mcdermott@nienow.com",
  "ip":"171.248.94.57",
  "macAddress":"78:E2:44:16:7F:9C",
  "website":"http://walter.com",
  "image":"http://placeimg.com/640/480/people"
}*/
