class Random_user {
  String? title;
  String? firstname;
  String? lastname;
  String? city;
  String? state;
  String? country;
  String? picturelarge;
  Random_user(
    this.city,
    this.country,
    this.state,
    this.firstname,
    this.lastname,
    this.picturelarge,
    this.title,
  );
  Random_user.fromjson(Map<String, dynamic> json) {
    title = json['name']['title'];
    firstname = json['name']['first'];
    lastname = json['name']['last'];
    city = json['location']['city'];
    state = json['location']['state'];
    country = json['location']['country'];
    picturelarge = json['picture']['thumbnail'];
  }
}



// class Random_user {
//   String? title;
//   String? firstName;
//   String? lastName;
//   String? city;
//   String? state;
//   String? country;
//   String? pictureLarge;

//   Random_user(
//     this.city,
//     this.country,
//     this.state,
//     this.firstName,
//     this.lastName,
//     this.pictureLarge,
//     this.title,
//   );

//   Random_user.fromjson(Map<String, dynamic> json) {
//     title = json['name']['title'];
//     firstName = json['name']['first'];
//     lastName = json['name']['last'];
//     city = json['location']['city'];
//     state = json['location']['state'];
//     country = json['location']['country'];
//     pictureLarge = json['picture']['large'];
//   }
// }
