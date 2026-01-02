import 'package:mozaeapp/content/appimageassets.dart';
import 'package:mozaeapp/model/onboarding_model.dart';

List<Onboardingmodel> onbordinglist = [
  Onboardingmodel(
    title: "إدارة ذكية للمندوبين",
    body: """
وزّع المهام تلقائيًا على المندوبين
وحسّن الأداء ووفّر الوقت والجهد
""",

    image: AppImageassets.onBordingimageOne,
  ),
  Onboardingmodel(
    title: "إدارة توزيع البضائع بسهولة",
    body: """
تحكم في عمليات توزيع البضائع من مكان واحد
وتابع الطلبات والمندوبين بكل احترافية
""",
    image: AppImageassets.onBordingimageThree,
  ),
  Onboardingmodel(
    title: "تتبع البضائع بدقة عالية",
    body: """
اعرف موقع البضائع في أي وقت
 وبأعلى مستوى من الموثوقية
""",
    image: AppImageassets.onBordingimageTow,
  ),
];
