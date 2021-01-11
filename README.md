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

### Button Form

![Button form](https://i.ibb.co/L9QCTjr/CButton.jpg)

#### Sample Usage
```dart
CButton(
	text: "Kit1 : AFC58",
	colorText: Colors.black,
	colorBackground: COLOR_GREEN,
	fontSize: 16,
	height: 40,
	borderRadius: BorderRadius.only(
	    bottomLeft: const Radius.circular(40.0),
	    topLeft: const Radius.circular(40.0)),
	prefixIcon: Icon(
	    Icons.autorenew,
	    color: Colors.black
	),
	onPressed: () { },
      ),
```
