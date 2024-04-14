from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_Form(object):
    def setupUi(self, Form):
        Form.setObjectName("Form")
        Form.resize(360, 640)
        self.lineEdit = QtWidgets.QLineEdit(Form)
        self.lineEdit.setGeometry(QtCore.QRect(20, 240, 321, 41))
        self.lineEdit.setObjectName("lineEdit")
        self.label = QtWidgets.QLabel(Form)
        self.label.setGeometry(QtCore.QRect(140, 210, 91, 20))
        self.label.setWordWrap(True)
        self.label.setObjectName("label")
        self.pushButton = QtWidgets.QPushButton(Form)
        self.pushButton.setGeometry(QtCore.QRect(120, 300, 111, 41))
        self.pushButton.setObjectName("pushButton")

        self.retranslateUi(Form)
        QtCore.QMetaObject.connectSlotsByName(Form)

        # Connect the "Copy to Clipboard" button to the copyToClipboard function
        self.pushButton.clicked.connect(self.copyToClipboard)

    def retranslateUi(self, Form):
        _translate = QtCore.QCoreApplication.translate
        Form.setWindowTitle(_translate("Form", "Form"))
        self.label.setText(_translate("Form", "Contract Value : "))
        self.pushButton.setText(_translate("Form", "Copy to Clipboard"))

    def copyToClipboard(self):
        # Ensure QApplication is properly initialized
        app = QtWidgets.QApplication.instance()
        if app is None:
            app = QtWidgets.QApplication([])
        
        # Get the text from the QLineEdit
        text = self.lineEdit.text()

        # Use QApplication.clipboard() to get the clipboard object
        clipboard = QtWidgets.QApplication.clipboard()

        # Set the text to the clipboard
      #  clipboard.setText(text)



if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Form = QtWidgets.QWidget()
    ui = Ui_Form()
    ui.setupUi(Form)
    Form.show()
    sys.exit(app.exec_())
