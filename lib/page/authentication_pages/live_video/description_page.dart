import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../component/base_appbar.dart';

class DescriptionPage extends StatelessWidget {

  final String nationalCodeController;
  final String mobileNumberController;
  final String birthdayController;
  final String nationalCodeSerialController;
  final String postCodeController;
  final List<CameraDescription> cameras;
  
  const DescriptionPage({super.key, required this.nationalCodeController, 
  required this.mobileNumberController, required this.birthdayController, 
  required this.nationalCodeSerialController, required this.postCodeController,
  required this.cameras});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "توضیحات",
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/fanaar background image.png"),
                fit: BoxFit.fill,
            opacity: 0.15)
        ),
        child: Container(
          margin: EdgeInsets.only(
              right: 10,
              left: 20,
              top: 10,
              bottom: 10
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 15,),
              Center(
                  child: Text("احراز هویت تغییر چهره",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 23
                    ),)),
              Divider(color: Colors.grey[600],),
              SizedBox(height: MediaQuery.of(context).size.height / 50,),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text("آخرین مرحله پیش از صدور گواهی، تصدیق چهره متقاضی است که با کلیک بر روی گزینه احراز هویت چهره، فرایند آن آغاز می شود.\n"
                      "توصیه می شود قیل از شروع فرآیند تصدیق چهره شما به طور کامل در کادر مشخص شده قرار گیرد :",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30
                      )
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 50,),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text("1".toPersianDigit()+ "- شئونات اسلامی را رعایت نموده و از داشتن ماسک و عینک خودداری نمایید.",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30
                      )
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 100,),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text("2".toPersianDigit()+ "- دوربین تلفن همراه را به گونه ای در مقابل صورت خود قرار دهید که چهره شما به طور کامل در کادر مشخص شده قرار بگیرد.",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30
                      )
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 100,),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text("3".toPersianDigit()+ "- مواردی که حین فرآیند تصدیق چهره از شما درخواست می شود را بدرستی انجام دهید.",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30
                      )
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 100,),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text("4".toPersianDigit()+ "- پس از اتمام اسکن تصویر چهره، شکیبا باشید تا نتیجه فرآیند اعلام گردد و به صفحه اصلی بازگردانده شوید.",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 30,
                      )
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
