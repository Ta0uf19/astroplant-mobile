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

## Card Metric (CCardMetric)
 ![]( https://i.ibb.co/8xVKPzL/image.png)
```dart
CCardMetric(  
  title: "Air Co² Sensor",  
  subtitle: "Carbon concentration",  
  measure: "550",  
  unit: "ppm",  
  onPressed: () {},
  activeToggle: false,
),
```

## Widget Toggle   (*CToggleWidget*)
A horizontal set of toggle buttons that can be used with any Widget.
 The widget toggle manages its own state.

![](https://i.ibb.co/qrjZ76B/U8ux5-Nxdx-Q.gif)

#### Sample Usage
  With **CCardMetric** as children
```dart
CToggleWidget(
   onPressed: (index) { log("card pressed $index "); }, 
   children: [  
      CCardMetric(  
         title: "Air Co² Sensor",  
         subtitle: "Carbon concentration",  
         measure: "550",  
         unit: "ppm",  
         onPressed: () {},  
      ),  
      CCardMetric(  
         title: "Temperature",  
         subtitle: "Temperature",  
         measure: "18",  
         unit: "°C",  
         onPressed: () {},  
      ),  
      CCardMetric(  
      title: "Air Co² Sensor",  
      subtitle: "Carbon concentration",  
      measure: "550",  
      unit: "ppm",  
      onPressed: () {},  
      ),
   ]
)
 ```
With **CButton** as children
```dart
CToggleWidget(  
   onPressed: (index) {  
     log("button pressed " + index.toString());  
    },  
   defaultSelectedIndex: 0,  
   children: [  
      CButton(  
         fontSize: 14,  
         borderRadius: BorderRadius.circular(5),  
         text: "Month",  
         onPressed: () {  log("pressed month button"); }, 
         disabled: true,  
     ),  
     CButton(  
        fontSize: 14,  
        text: "Year",  
        onPressed: () {  log("pressed year button"); },  
        borderRadius: BorderRadius.circular(5),  
        disabled: true,  
    )
   ]
)
```
### Props
Children widgets must implement `ITogglable<T extends Widgets>` interface and add props `bool activeToggle` used for styling purpose of active toggle widget
 ```dart
 abstract class IToggleable<T extends Widget> {  
   /// This methods clone immutable widget and add the possibility to specify  
   /// active/inactive state for toggle widget when pressed
   T copyWith({bool activeToggle});  
}
 ```
| Name              | Explanation                                                                       | Default                          |
|-------------------|----------------------------------------------------------------------------|----------------------------------|
| children| List of widgets                                                             | null                                |
| onPressed(*index*) | Callback when a widget item is pressed                                 | null                             |                       |
| defaultSelectedIndex| Default selected/active widget index                                                          |  0                     |
| spacePadding| Space between widgets (right padding)                                                           | 20                     |
