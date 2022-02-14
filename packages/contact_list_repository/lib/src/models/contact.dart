class Contact {
  final String name;
  final String lastname;
  final String mobile;
  final String mail;
  final String address;
  final String description;

  const Contact({
    this.name = '',
    this.lastname = '',
    this.mobile = '',
    this.mail = '',
    this.address = '',
    this.description = '',
  });

  Contact copyWith({
    String? name,
    String? lastname,
    String? mobile,
    String? mail,
    String? address,
    String? description,
  }) {
    return Contact(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      mobile: mobile ?? this.mobile,
      mail: mail ?? this.mail,
      address: address ?? this.address,
      description: description ?? this.description,
    );
  }
}
