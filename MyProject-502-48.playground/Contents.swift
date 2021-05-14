import SwiftUI
import UIKit
import PlaygroundSupport
import Foundation

//สร้างการคำนวณหาค่า BMI
struct MyBMICalculatorView : View
{//open1
    //ตัวแปร นเำหนัก ส่วนสูง ผลการแปรค่า
    @State private var myWeight : Int = 45
    @State private var myHeight : Int = 170
    @State private var myBMIResult : String = ""
    //functionใช้แปลความหมายของค่าBMIที่คำนวณมาได้
    func bmiResult_func (bmiValue : Double) -> String {//open2 คืนค่า to string
        var result : String = "BMI value = \(bmiValue)\n"
        if bmiValue >= 40.0
        {
            result += "อ้วนถึงขีดสุด กรุณาพบแพทย์"
        }
        
        else if bmiValue >= 35.0
        {
            result += "อ้วนระดับ 2 ต้องควบคุมอาหารและออกกำลังกายอย่างจริงจัง"
        }
        
        else if bmiValue >= 28.5
        {
            result += "อ้วนระดับ 1 มีโอกาสเป็นโรค้บาหวาน ความดัน จำเป็นต้องควบคุมอาหารและออกกำลังกาย"
        }
            
        else if bmiValue >= 23.5
        {
            result += "น้ำหนักเกิน หากมีกรรมพันธุ์เป็นโรคเบาหวาน ไขมันในเลือดสูง ต้องพยายามลดดัชนีมวลกายให้ต่ำกว่า 23"
        }
        
        else if bmiValue >= 18.5
        {
            result += "น้ำหนักปกติ"
        }
        
        else
        {
            result += "น้ำหนักน้อยเกินไป ควรรับประทานอาหารที่มีคุณภาพ มีพลังงานเพียงพอ ออกกำลังกายอย่างเหมาะสม"
        }
        return result
    }//close 2
    var body:some View
    {//open3
        ZStack
            {//open4
                Color.init(red:239.0/255.0, green:244.0/255.0, blue:244.0/255.0)
                VStack
                    {//open5
                        VStack
                            {//open6
                                Stepper("Weight \(self.myWeight) Kg.", onIncrement: {//แสดงข้อมูลน้ำหนักและตัวแปรmyWeight
                                    self.myWeight += 1
                                }, onDecrement: {
                                    self.myWeight -= 1
                                } )
                                    .font(.system(size: 20, weight: .heavy))
                                    .foregroundColor(.white).frame(minWidth: 0, maxWidth: .infinity, minHeight: 40)
                                    .padding(20).background(Color.orange).cornerRadius(10)
                                Stepper("Height \(self.myHeight) cm.", onIncrement: {//show hight info and myHeight var
                                    self.myHeight += 1
                                }, onDecrement: {
                                    self.myHeight -= 1
                                })
                                    .font(.system(size: 20, weight: .heavy))
                                    .foregroundColor(.white).frame(minWidth: 0, maxWidth: .infinity, minHeight: 40)
                                    .padding(20).background(Color.orange).cornerRadius(10)
                                    .offset(y : -5)//กำหนดระยะห่างการแสดงผลของframe
                            }//close6
                            .offset(y : 50)//กำหนดระยะห่างจากด้านบนของ Stepper น้ำหนัก/ส่วนสูง
                        HStack
                            {//open7-HStack to show result from left to right of BMI button and clear info
                                Button(action: {self.myBMIResult = self.bmiResult_func(bmiValue: Double(self.myWeight)/(pow(Double(self.myHeight)/100.0,2.0 )))}){
                                        Text("Show BMI result").fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, minHeight: 40)
                                            .background(Color.red).foregroundColor(Color.white).cornerRadius(10)
                                }
                                Button(action: {
                                    self.myBMIResult = ""
                                })
                                {
                                    Text("Clear information")//for delete info
                                        .fontWeight(.bold).frame(minWidth:0, maxWidth: .infinity, minHeight: 40)
                                        .background(Color.red).foregroundColor(Color.white).cornerRadius(10)
                                }
                                
                        }//close7-HStack
                            .offset(y : 50)//กำหนดระยะห่างจากด้านบนของปุ่ม show bmi result && clear info button
                        Text("\(myBMIResult)")
                        .lineLimit(nil)//nil=unlimit line
                            .multilineTextAlignment(.leading)//การจัดข้อความ center-trailing-leading
                            .frame(minWidth:0, maxWidth: .infinity).offset(y:100)
                        Spacer()//ปรับระยะห่างของ obj
                    }//close5
                    .padding(.horizontal, 20)//เว้นระยะขอบซ้ายขวา 20 ของปุ่มน้ำหนักส่วนสูง
                .navigationBarTitle("คำนวณค่า BMI")
            }//close4
    }//close3
}//close1

 //สร้างส่วน developer

struct developerView : View
{
    //open1
    var body: some View
    {//open2
        ZStack {
            VStack {//open3
                Image(uiImage: UIImage(named: "502-48.jpg")!)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                    .shadow(radius:15)
                Text("Developer Detail")
                Text("by Chanyanuch Panyadee")
                Text("Email: 34966@montfort.ac.th")
                Text("Study Place: Montfort College")
                    .fontWeight(.bold).foregroundColor(.white)
                .padding(50)
            
                
            }//close3
        }
    }//close2
}//close1


//create mainView show ฟน้าจอหลัก app
struct mainView: View {//open1
    var body: some View {//open2
        NavigationView {//open3 new page
            VStack {//open4
                NavigationLink(destination: MyBMICalculatorView()){//open5 link to wanted struct
                    Image(uiImage: UIImage(named:"BMI2.PNG")!)
                        .renderingMode(.original) //ให้รูปไม่เปลี่ยนเป็นสีฟ้า ให้ออกเป็นสีปกติ
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle()).overlay(Circle().stroke(Color.green, lineWidth: 5))
                    .padding(5)
                }//close5
                Text("คำนวณหาค่าดัชนีมวลกาย(BMI)")
                    .fontWeight(.bold)
                    .offset(y:-10)//การจัดวางตำแหน่ง obj in y axis ให้ขยับขึ้นลงตามเลขที่ระบุ
                    .padding(.bottom,5)
                NavigationLink(destination: developerView()){//open6
                    Image(uiImage: UIImage(named: "developer.jpg")!)
                        .renderingMode(.original)
                    .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle()).overlay(Circle().stroke(Color.green, lineWidth: 5))
                    .padding(5)
                }//close6
                Text("About Developer")
                    .fontWeight(.bold)
                    .offset(y:-5)//การจัดวางตำแหน่ง
                    .padding(.bottom,5)
            }//close4
                .navigationBarTitle("BMI Calculator", displayMode: .large).foregroundColor(Color.pink)
        }//close3
    }//close2
    
}//close1
PlaygroundPage.current.setLiveView(mainView())
//PlaygroundPage.current.setLiveView(developerView())
//PlaygroundPage.current.setLiveView(MyBMICalculatorView())

