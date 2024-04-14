from PyQt5 import QtCore, QtGui, QtWidgets
import os

class Ui_Form(object):
    def setupUi(self, Form):
        Form.setObjectName("Form")
        Form.resize(340, 640)
        self.lineEdit = QtWidgets.QLineEdit(Form)
        self.lineEdit.setGeometry(QtCore.QRect(30, 180, 281, 41))
        self.lineEdit.setObjectName("lineEdit")
        self.label_2 = QtWidgets.QLabel(Form)
        self.label_2.setGeometry(QtCore.QRect(40, 150, 161, 21))
        self.label_2.setFrameShape(QtWidgets.QFrame.Box)
        self.label_2.setScaledContents(True)
        self.label_2.setWordWrap(True)
        self.label_2.setObjectName("label_2")
        self.label_3 = QtWidgets.QLabel(Form)
        self.label_3.setGeometry(QtCore.QRect(40, 240, 161, 21))
        self.label_3.setFrameShape(QtWidgets.QFrame.Box)
        self.label_3.setScaledContents(True)
        self.label_3.setWordWrap(True)
        self.label_3.setObjectName("label_3")
        self.lineEdit_2 = QtWidgets.QLineEdit(Form)
        self.lineEdit_2.setGeometry(QtCore.QRect(30, 280, 281, 41))
        self.lineEdit_2.setObjectName("lineEdit_2")
        self.label_4 = QtWidgets.QLabel(Form)
        self.label_4.setGeometry(QtCore.QRect(40, 350, 161, 21))
        self.label_4.setFrameShape(QtWidgets.QFrame.Box)
        self.label_4.setScaledContents(True)
        self.label_4.setWordWrap(True)
        self.label_4.setObjectName("label_4")
        self.lineEdit_3 = QtWidgets.QLineEdit(Form)
        self.lineEdit_3.setGeometry(QtCore.QRect(30, 390, 281, 41))
        self.lineEdit_3.setObjectName("lineEdit_3")
        self.pushButton = QtWidgets.QPushButton(Form)
        self.pushButton.setGeometry(QtCore.QRect(130, 480, 75, 23))
        self.pushButton.setObjectName("pushButton")

        self.retranslateUi(Form)
        QtCore.QMetaObject.connectSlotsByName(Form)

        # Generate random values for the QLineEdit fields
        self.lineEdit.setText(self.generate_random_hex(64))
        self.lineEdit_2.setText(self.generate_random_hex(64))
        self.lineEdit_3.setText(self.generate_random_hex(64))

    def retranslateUi(self, Form):
        _translate = QtCore.QCoreApplication.translate
        Form.setWindowTitle(_translate("Form", "Form"))
        self.label_2.setText(_translate("Form", "<html><head/><body><p><span style=\" font-size:7pt; font-weight:600;\">Enter Contract Deployment Value :</span></p></body></html>"))
        self.label_3.setText(_translate("Form", "<html><head/><body><p><span style=\" font-size:7pt; font-weight:600;\">Enter Sbox Function Value :</span></p></body></html>"))
        self.label_4.setText(_translate("Form", "<html><head/><body><p><span style=\" font-size:7pt; font-weight:600;\">Enter your Secret Key</span></p></body></html>"))
        self.pushButton.setText(_translate("Form", "Enter"))

    def generate_random_hex(self, length):
        # Generate random bytes and convert to hexadecimal
        return os.urandom(length).hex()

if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Form = QtWidgets.QWidget()
    ui = Ui_Form()
    ui.setupUi(Form)
    Form.show()
    sys.exit(app.exec_())
