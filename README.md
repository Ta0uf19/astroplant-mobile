# Astroplant UI Flutter Widgets


### Input Form

![Input form](https://i.ibb.co/LNDxLt5/image.png)

#### Sample Usage
```dart
    CTextInput(  
      textHint: "Password",
      textColor: Color(0xFFDCDCDC),
      isPasswordType: true,
      icon: Icon(Icons.search, color: Colors.lightGreenAccent), 
      backgroundColor: Color(0xFF1D1D1D)
      fontSize: 18
    ),
```

### Checkbox Form
 ![](https://i.ibb.co/Ycqd2vM/image.png)
 
#### Sample Usage
```dart
    CToggleSwitch(  
	  value: status,  
	  width: 35,  
	  height: 20,  
	  toggleSize: 15,  
	  onToggle: (val) {  
		  setState(() {  
			  status = val;  
		 });
	  }
	)
```

### Bottom Navigation Bar
![](https://i.ibb.co/R09d8q1/ezgif-com-gif-maker-1.gif)

#### Sample Usage

```dart
   return Scaffold(
	    bottomNavigationBar: CBottomNav(  
		    items: [  
			  CBottomNavItem(CustomIcons.dashboard),  
			  CBottomNavItem(CustomIcons.commands),  
			  CBottomNavItem(CustomIcons.settings),  
			],  
			iconStyle: IconStyle(size: 23),
			color: Colors.green,
			backgroundColor: Colors.black
		),
	)
```
