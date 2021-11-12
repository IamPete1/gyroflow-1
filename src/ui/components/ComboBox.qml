import QtQuick 2.15;
import QtQuick.Controls 2.15 as QQC;

QQC.ComboBox {
    id: root;

    //property alias icon: ti.icon;
    property alias itemHeight: pp.itemHeight;

    implicitWidth: 150 * dpiScale;
    height: 35 * dpiScale;

    font.pixelSize: 13 * dpiScale;
    font.family: styleFont;

    hoverEnabled: enabled;

    delegate: pp.contentItem.delegate;

    indicator: DropdownChevron { height: pp.itemHeight / 2.4; }

    background: Rectangle {
        color: root.hovered? Qt.lighter(styleButtonColor, 1.2) : styleButtonColor;
        opacity: root.down || !parent.enabled? 0.75 : 1.0;
        Ease on opacity { duration: 100; }
        radius: 6 * dpiScale;
        anchors.fill: parent;
        border.width: style === "light"? (1 * dpiScale) : 0;
        border.color: "#cccccc";
    }

    scale: root.pressed? 0.98 : 1.0;
    Ease on scale {  }

    contentItem: Text {
        id: ti;
        text: root.displayText;
        color: styleTextColor;
        font: root.font;
        anchors.left: parent.left;
        anchors.leftMargin: 10 * dpiScale;
        verticalAlignment: Text.AlignVCenter;
        opacity: parent.enabled? 1.0 : 0.5;
    }

    popup: Popup {
        id: pp;
        font: root.font;
        model: root.delegateModel;
        currentIndex: root.currentIndex;
        highlightedIndex: root.highlightedIndex;
    }

    property alias tooltip: tt.text;
    ToolTip { id: tt; visible: text.length > 0 && root.hovered; }
}