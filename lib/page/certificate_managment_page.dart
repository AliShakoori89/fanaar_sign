import 'package:camera/camera.dart';
import 'package:fanar_sign/bloc/certificate_store/event.dart';
import 'package:fanar_sign/component/main_page_card.dart';
import 'package:fanar_sign/page/no_data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/certificate_store/bloc.dart';
import '../bloc/certificate_store/state.dart';
import '../component/base_appbar.dart';
import '../component/floating_action_button.dart';
import '../const/app_color.dart';
import 'certificate_details_page.dart';

class CertificateManagementPage extends StatefulWidget {

  CertificateManagementPage({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription> cameras;

  @override
  State<CertificateManagementPage> createState() => _CertificateManagementPageState(cameras);
}

class _CertificateManagementPageState extends State<CertificateManagementPage> {

  final List<CameraDescription> cameras;
  _CertificateManagementPageState(this.cameras);

  @override
  void initState() {

    final certificateBloc = BlocProvider.of<CertificateBloc>(context);
    certificateBloc.add(FetchAllCertificateEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BaseAppBar(title: "مدیریت گواهی امضاء"),
      floatingActionButton: MYAppFloatingActionButton(
        buttonName: 'صدور گواهی جدید',
        buttonType: 'CertificateManagementPage',
        cameras: widget.cameras),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/fanaar background image.png"),
                fit: BoxFit.fill,
                opacity: 0.15)
        ),
        child: BlocBuilder<CertificateBloc, CertificateState>(builder: (context, state){
          return state.status.isLoading
              ? Center(
              child: CircularProgressIndicator())
              : state.status.isSuccess
              ? state.storeCertificate.length == 0
              ? NoDataPage()
              : ListView.builder(
              itemCount: state.storeCertificate.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          CertificateDetails(
                          selectProduceName: state.storeCertificate[index].selectProduceName!,
                          certificateExpirationDate: state.storeCertificate[index].certificateExpirationDate!,
                          certificateValidityPeriod: state.storeCertificate[index].certificateValidityPeriod!,)),
                    );
                  },
                  child: Column(
                    children: [
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 5,
                          margin: const EdgeInsets.only(
                            top: 10,
                            right: 15,
                            left: 15,
                            bottom: 10
                          ),
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width / 20
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 40,
                                    ),
                                    Text(
                                      "نام مرکز صادر کننده :",
                                      style: TextStyle(color: Colors.black,
                                          fontSize: MediaQuery.of(context).size.width / 25,
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 100,
                                    ),
                                    Text(
                                      "نوع گواهی :",
                                      style: TextStyle(color: Colors.black,
                                        fontSize: MediaQuery.of(context).size.width / 27,
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 100,
                                    ),
                                    Text(
                                      "تاریخ صدور :",
                                      style: TextStyle(color: Colors.black,
                                        fontSize: MediaQuery.of(context).size.width / 27,
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 100,
                                    ),
                                    Text(
                                      "تاریخ انقضا :",
                                      style: TextStyle(color: Colors.black,
                                        fontSize: MediaQuery.of(context).size.width / 27,
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 100,
                                    ),
                                    Text(
                                      "سریال گواهی :",
                                      style: TextStyle(color: Colors.black,
                                        fontSize: MediaQuery.of(context).size.width / 27,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 40,
                                    ),
                                    Text(
                                      state.storeCertificate[index].certificateIssuerInterMediateCAName!,
                                      style: TextStyle(color: Colors.black,
                                          fontSize: MediaQuery.of(context).size.width / 25,
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 100,
                                    ),
                                    Text(
                                      state.storeCertificate[index].selectProduceName!,
                                      style: TextStyle(color: Colors.black,
                                        fontSize: MediaQuery.of(context).size.width / 27,
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 60,
                                    ),
                                    Text(
                                      state.storeCertificate[index].certificateIssuedDate!,
                                      style: TextStyle(color: Colors.black,
                                        fontSize: MediaQuery.of(context).size.width / 27,
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 60,
                                    ),
                                    Text(
                                      state.storeCertificate[index]. certificateExpirationDate!,
                                      style: TextStyle(color: Colors.black,
                                        fontSize: MediaQuery.of(context).size.width / 27,
                                      ),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height / 60,
                                    ),
                                    Text(
                                      state.storeCertificate[index].certificateSerialCode!,
                                      style: TextStyle(color: Colors.black,
                                        fontSize: MediaQuery.of(context).size.width / 27,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 20,
                          right: MediaQuery.of(context).size.width / 20,
                        ),
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                );
              },
              )
              : state.status.isError
              ? const Center(
                  child: Text('Error'),
                )
              : NoDataPage();
        }
        ),
      )
    );
  }
}
