class Events {
  int id;
  String eventOwner;
  String image;
  String location;
  String latitude;
  String longitude;
  String title;
  String price;
  String description1;
  String venue;
  int category;
  String eventdate;
  int maxTickets;
  bool status;
  bool isPaid;
  String date_to_stop_ticketing;
  String event_start_date;
  String event_end_date;
  String eventStartTime;
  String eventEndTime;

  Events({
    this.image,
    this.location,
    this.price,
    this.latitude,
    this.longitude,
    this.id,
    this.eventOwner,
    this.title,
    this.description1,
    this.category,
    this.venue,
    this.eventdate,
    this.status,
    this.isPaid,
    this.maxTickets,
    this.date_to_stop_ticketing,
    this.event_start_date,
    this.event_end_date,
    this.eventEndTime,
    this.eventStartTime,
  });

  factory Events.getfromJson(Map<String, dynamic> json) {
    return new Events(
      id: json['id'],
      eventOwner: json['eventOwner'],
      title: json['title'],
      description1: json['description1'],
      category: json['category'],
      price: json['price'],
      venue: json['venue'],
      location: json['location'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      eventdate: json['eventdate'],
      status: json['status'],
      image: json['image'],
      isPaid: json['is_paid'],
      maxTickets: json['max_tickets'],
      date_to_stop_ticketing: json['date_to_stop_ticketing'],
      event_start_date: json['event_start_date'],
      event_end_date: json['event_end_date'],
      eventEndTime: json['event_start_time'],
      eventStartTime: json['event_end_time'],
    );
  }
}
