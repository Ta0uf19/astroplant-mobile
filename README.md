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

![Button form](https://i.ibb.co/GT6xxs8/68747470733a2f2f692e6962622e636f2f4c395143546a722f43427574746f6e2e6a7067.jpg)

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


## CCard
![](https://i.ibb.co/gRFHL45/CCard.jpg)

#### Sample Usage

```dart
   return CCard(
                    body: CColumnText(
                      title: "Temp",
                      subTitle: "Identifier : #127",
                      description: "Virtual temperature sensor",
                      colorText: Colors.white,

                    ),
                    colorBackground: Color.fromRGBO(29, 29, 29, 1),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('onPressed CCard'),
                      ));
                    },
                    suffixWidget: Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        color: Colors.white,
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('onPressed suffixWidget'),
                          ));
                        },

                      ),
                    ),
                  )
```

#### Props

| Name              | Explanation                                                             |      
|-------------------|-------------------------------------------------------------------------|
| colorBackground   | the backgroud color of the card                                         | 
| width             | the width of the card                                                   | 
| height            | the height of the card                                                  | 
| borderRadius      | the raduis of the card                                                  |  
| padding           | padding of the card                                                     | 
| onPressed         | (required) callback when the card is pressed                            |                             
| body              | the main widget that the Card display                                   |                             
| suffixWidget      | widget in the right of the body widget always stick to the end          |        

## CColumnText

#### Description

Show three texts in column (title, subtitle and description)

#### Sample Usage

```dart
   return CColumnText(
                      title: "Temp",
                      subTitle: "Identifier : #127",
                      description: "Virtual temperature sensor",
                      colorText: Colors.white,

                    ),
```

#### Props

| Name              | Explanation                                                             |      
|-------------------|-------------------------------------------------------------------------|
| colorText         | the color of the three texts                                            | 
| fontSize          | fontsize of the title, subTitle and description take fontsize-2         |
| title             | a text with size = fontsize, color = colorText                          | 
| subTitle          | a text with size = fontsize-2, color = colorText.withOpacity(0.5)       | 
| description       | a text with size = fontsize-2, color = colorText.withOpacity(0.25)      |  
| spaceBetween      | space between the three texts                                           | 
