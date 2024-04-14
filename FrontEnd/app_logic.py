from PyQt5 import QtWidgets, QtCore
from first_page import Ui_Form as Ui_Form1
from second_page import Ui_Form as Ui_Form2

class MainWindow(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()

        # Create a QStackedWidget
        self.stackedWidget = QtWidgets.QStackedWidget()
        self.setCentralWidget(self.stackedWidget)

        # Create the first page
        self.page1 = QtWidgets.QWidget()
        self.ui1 = Ui_Form1()
        self.ui1.setupUi(self.page1)
        self.stackedWidget.addWidget(self.page1)

        # Create the second page
        self.page2 = QtWidgets.QWidget()
        self.ui2 = Ui_Form2()
        self.ui2.setupUi(self.page2)
        self.stackedWidget.addWidget(self.page2)


        # Connect the button on the first page to switch to the second page
        self.ui1.pushButton.clicked.connect(self.switchToPage2)

    def switchToPage2(self):
        # Retrieve the contract deployment value from the first page
        deployment_value = self.ui1.lineEdit.text()

        # Generate the contract address (this is a placeholder, replace with your actual logic)
        contract_address = "Generated Address" # Example: You would replace this with your actual logic to generate the contract address

        # Display the contract address on the second page
        self.ui2.lineEdit.setText(contract_address)

        # Switch to the second page
        self.stackedWidget.setCurrentIndex(1)

if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())
