# Astroplant UI Flutter Widgets


## Input Form

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

## Checkbox Form
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

## Button Form

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

## Bottom Navigation Bar
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

#### Props

| Name              | Explanation                                                                       | Default                          |
|-------------------|----------------------------------------------------------------------------|----------------------------------|
| index             | starting index                                                             | 0                                |
| onTap             | callback when a bottom nav item is pressed                                 | null                             |
| items             | bottom nav items                                                           | null                             |
| backgroundColor             | background color                                                           |  Color(0xFF1B1E2F)                     |
| color | color of the selected item border                                                           | Color(0xFF6F717C)                     |
| iconStyle         | icon styles (`size`, `onSelectSize`, `color`, `onSelectColor`)             | null                             