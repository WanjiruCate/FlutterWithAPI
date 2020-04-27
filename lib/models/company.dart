class Company {
  int id;
  String name;
  String createdAt;

  Company(
    this.id,
    this.name,
    this.createdAt,
  );
  static List<Company> getCompanyList() {
    return <Company>[
      Company(1, 'Apple', 'Today'),
      Company(1, 'Green', 'Tommorow'),
      Company(1, 'Orange', 'Today'),
      Company(1, 'Pine', 'Today'),
      Company(1, 'Cherry', 'Today'),
    ];
  }
}
