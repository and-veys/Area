import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Window {
    id: window
    visible: true
    width: 700
    height: 400
    title: qsTr("Homework #1")


    Rectangle {
        id: frame_1
        anchors.margins:    20
        anchors.left: parent.left
        anchors.top: parent.top
        color: "lightgreen"
        radius: 20
        width: 300
        height: 300
        Column {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            TextField {
                id: side_A
                placeholderText: qsTr("Side A")
                horizontalAlignment: TextInput.AlignHCenter
                onTextChanged: change(side_Res)
            }
            TextField {
                id: side_B
                placeholderText: qsTr("Side B")
                horizontalAlignment: TextInput.AlignHCenter
                onTextChanged: change(side_Res)
            }
            TextField {
                id: side_C
                placeholderText: qsTr("Side C")
                horizontalAlignment: TextInput.AlignHCenter
                onTextChanged: change(side_Res)
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Calculate"
                onClicked: calculate_1()
            }
            TextField {
                id: side_Res
                placeholderText: qsTr("Area")
                readOnly: true
                horizontalAlignment: TextInput.AlignHCenter
            }
        }
    }
    Rectangle {
        id: frame_2
        anchors.margins:    20;
        anchors.left: frame_1.right
        anchors.top: parent.top
        color: "silver"
        radius: 20
        width: 300
        height: 300
        Column {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 10
            Row {
                spacing: 5
                TextField {
                    id: xA
                    width:  100
                    placeholderText: qsTr("A: X")
                    horizontalAlignment: TextInput.AlignHCenter
                    onTextChanged: change(coord_Res)
                }
                TextField {
                    id: yA
                    width:  xA.width
                    placeholderText: qsTr("A: Y")
                    horizontalAlignment: TextInput.AlignHCenter
                    onTextChanged: change(coord_Res)
                }
            }
            Row {
                spacing: 5
                TextField {
                    id: xB
                    width:  100
                    placeholderText: qsTr("B: X")
                    horizontalAlignment: TextInput.AlignHCenter
                    onTextChanged: change(coord_Res)
                }
                TextField {
                    id: yB
                    width:  xA.width
                    placeholderText: qsTr("B: Y")
                    horizontalAlignment: TextInput.AlignHCenter
                    onTextChanged: change(coord_Res)
                }
            }
            Row {
                spacing: 5
                TextField {
                    id: xC
                    width:  100
                    placeholderText: qsTr("C: X")
                    horizontalAlignment: TextInput.AlignHCenter
                    onTextChanged: change(coord_Res)
                }
                TextField {
                    id: yC
                    width:  xA.width
                    placeholderText: qsTr("C: Y")
                    horizontalAlignment: TextInput.AlignHCenter
                    onTextChanged: change(coord_Res)
                }
            }
            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Calculate"
                onClicked: calculate_2()
            }
            TextField {
                id: coord_Res
                placeholderText: qsTr("Area")
                readOnly: true
                horizontalAlignment: TextInput.AlignHCenter
            }


        }
    }

    function calculate_1() {
        let a = getNumber(side_A);
        let b = getNumber(side_B);
        let c = getNumber(side_C);
        side_Res.text = getStringResult(a, b, c);
    }
    function calculate_2() {
        let a = getSide(xA, yA, xB, yB);
        let b = getSide(xB, yB, xC, yC);
        let c = getSide(xC, yC, xA, yA);
        coord_Res.text = getStringResult(a, b, c);

    }
    function getStringResult(a, b, c) {
        if(isNaN(a + b + c))
            return "Format Error";
        let area = calculate_area(a, b, c);
        if(isNaN(area))
            return "Result Error";
        let e = Math.pow(10, 6);
        return String(Math.round(area*e)/e);
    }
    function getNumber(txt, pos=true) {
        let res = Number(txt.text);
        if(txt.text === "" || isNaN(res))
            return NaN;
        if(pos && res < 0)
            return NaN
        return res;
    }
    function getSide(x_1, y_1, x_2, y_2) {
        let x1 = getNumber(x_1, false);
        let y1 = getNumber(y_1, false);
        let x2 = getNumber(x_2, false);
        let y2 = getNumber(y_2, false);
        if(isNaN(x1+y1+x2+y2))
            return NaN;
        return Math.sqrt(Math.pow((x1-x2), 2) + Math.pow((y1-y2), 2))
    }
    function calculate_area(a, b, c) {
        let p = (a + b + c)/2.0;
        return Math.sqrt(p*(p-a)*(p-b)*(p-c));
    }
    function change(res) {
        res.text = "";
    }
}



