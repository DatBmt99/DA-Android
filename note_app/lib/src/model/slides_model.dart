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
  sliderModel.setDesc("Notes App");
  sliderModel.setTitle("CHÀO MỪNG BẠN ĐẾN VỚI");
  sliderModel.setImageAssetPath("assets/images/notes.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Quản lý ghi chú cá nhân");
  sliderModel.setTitle("Ứng dụng");
  sliderModel.setImageAssetPath("assets/images/design_notes.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Đơn giản dễ sử dụng, giao diện hiện đại");
  sliderModel.setTitle("Tiện lợi");
  sliderModel.setImageAssetPath("assets/images/calendar.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //4
  sliderModel.setDesc("Dễ dàng làm việc, lên kế hoạch, ghi chú nhanh chóng, ");
  sliderModel.setTitle("Linh hoạt");
  sliderModel.setImageAssetPath("assets/images/plans.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //5
  sliderModel.setDesc("Lưu trữ sao lưu dữ liệu, thông báo người dùng ");
  sliderModel.setTitle("Đồng bộ");
  sliderModel.setImageAssetPath("assets/images/save.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
