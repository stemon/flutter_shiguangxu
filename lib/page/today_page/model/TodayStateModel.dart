import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';



import 'DialogStateModel.dart';

class TodayStateModel extends ChangeNotifier{
  bool showType;
  bool showLevel;

  bool updateTypeIcon;
  int checkTypeIndex;

  bool updateLeveleIcon;
  int checkLevelIndex;


  bool selectDate;

  String dateTips;


  TodayStateModel({this.showType=false, this.showLevel=false, this.updateTypeIcon=false,
    this.checkTypeIndex=2, this.updateLeveleIcon=false, this.checkLevelIndex=1,
    this.selectDate=false, this.dateTips});

  void  setShowTypeView(){
    this.showType=!showType;
    notifyListeners();
  }


  void  setShowLevelView(){
    this.showType=false;
    this.showLevel=!showLevel;
    notifyListeners();
  }

  void setCheckTypeIndex(index){
    this.checkTypeIndex=index;
    this.updateTypeIcon=true;
    setShowTypeView();
  }

  void setCheckLevelIndex(index){
    this.checkLevelIndex=index;
    this.updateLeveleIcon=true;
    setShowLevelView();
  }
  void setSelectDate(selectDate, DialogPageModel pageModel, int index,{bool isNotifyListeners=true}){


    this.selectDate=selectDate;
    this.showLevel=false;
    this.showType=false;


    _modelToDateTips(pageModel,index);


    if(isNotifyListeners)
    notifyListeners();
  }

  String _modelToDateTips(DialogPageModel pageModel,int index){

    if(pageModel!=null){
      switch (index) {
        case 0:
          this.dateTips =
          "${pageModel.selectDate.year}年${pageModel.selectDate.month}月${pageModel.selectDate.day}日 "
              "${DateUtil.getZHWeekDay(DateTime(pageModel.selectDate.year,pageModel.selectDate.month,pageModel.selectDate.day)
          )} ${_formatDateTxt(pageModel.initTimePoint[1])}:${_formatDateTxt(pageModel.initTimePoint[2])}";


          break;

        case 1:
          this.dateTips =
          "${pageModel.selectDate.year}年${pageModel.selectDate.month}月${pageModel.selectDate.day}日 "
              "${DateUtil.getZHWeekDay(DateTime(pageModel.selectDate.year,pageModel.selectDate.month,pageModel.selectDate.day)
          )} ${_formatDateTxt(pageModel.initTimeDistanceStart[1])}:${_formatDateTxt(pageModel.initTimeDistanceStart[2])}~${_formatDateTxt(pageModel.initTimeDistanceEnd[0])}:${_formatDateTxt(pageModel.initTimeDistanceEnd[1])}";
          break;
        case 1:
          this.dateTips =
          "${pageModel.selectDate.year}年${pageModel.selectDate.month}月${pageModel.selectDate.day}日 "
              "${DateUtil.getZHWeekDay(DateTime(pageModel.selectDate.year,pageModel.selectDate.month,pageModel.selectDate.day)
          )} ";
          break;
      }
    }else{
      this.dateTips=null;



    }
  }
  String _formatDateTxt(int value){
    return value < 10 ? '0$value' : value.toString();
}
}