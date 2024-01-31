import 'package:get/get.dart';

class myclassget extends GetxController
{

      RxInt total=0.obs;
      RxInt max=0.obs;
      RxInt min=0.obs;

      int t1=0,t2=0,t3=0;

      alldataget(String a,String b,String c)
      {
            t1=int.parse(a);
            t2=int.parse(b);
            t3=int.parse(c);

            total.value=t1+t2+t3;
            if(t1>t2 && t1>t3)
             {
                   max.value=t1;
             }
            else if(t2>t3)
              {
                    max.value=t2;
              }
            else
              {
                  max.value=t3;
              }

            if(t1<t2 && t1<t3)
            {
              min.value=t1;
            }
            else if(t2<t3)
            {
              min.value=t2;
            }
            else
            {
              min.value=t3;
            }

      }
}