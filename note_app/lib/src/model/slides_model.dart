class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("YOURBUS");
  sliderModel.setTitle("CHÀO MỪNG BẠN ĐẾN VỚI");
  sliderModel.setImageAssetPath("assets/images/bus_stop.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Xem biểu đồ giờ,xác định thời gian thực xe đến trạm. Theo dõi vị trí và luồng di chuyển của phương tiện");
  sliderModel.setTitle("Dự báo thời gian");
  sliderModel.setImageAssetPath("assets/images/travel_plans.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Tra cứu tìm kiếm địa điểm mong muốn phù hợp mục đích đi lại");
  sliderModel.setTitle("Tìm kiếm địa điểm dễ dàng");
  sliderModel.setImageAssetPath("assets/images/search.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //4
  sliderModel.setDesc("Dễ dàng thanh toán trực tiếp nhanh chóng sử dụng QR Code hoặc Thẻ");
  sliderModel.setTitle("Thanh toán online");
  sliderModel.setImageAssetPath("assets/images/online_payment.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //5
  sliderModel.setDesc("Tìm lộ trình gợi ý tối, tra cứu đầy đủ thông tin các tuyến kết hợp di chuyển đa phương tiện");
  sliderModel.setTitle("Chỉ đường");
  sliderModel.setImageAssetPath("assets/images/destinations.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
