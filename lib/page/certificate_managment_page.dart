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
      body: BlocBuilder<CertificateBloc, CertificateState>(builder: (context, state){
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
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 12,
                    margin: const EdgeInsets.only(
                      top: 20,
                      right: 15,
                      left: 15,
                      bottom: 10
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(color: AppColors.cardShadowColor,
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(
                            0.0, // Move to right 5  horizontally
                            5.0, // Move to bottom 5 Vertically
                          ),),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width / 20
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          state.storeCertificate[index].certificateIssuerInterMediateCAName!,
                          style: TextStyle(color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width / 25,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ),
                    ),
                  ),
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
      )
    );
  }
}
