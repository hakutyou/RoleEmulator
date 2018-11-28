import PyQt5.QtCore
import PyQt5.QtWidgets
import PyQt5.QtQml
import PyQt5.QtGui
import sys

import dmail


if __name__ == '__main__':
        app = PyQt5.QtWidgets.QApplication(sys.argv)
        # app.setWindowIcon(PyQt5.QtGui.QIcon('main.ico'))
        engine = PyQt5.QtQml.QQmlApplicationEngine()
        context = engine.rootContext()
        translator = PyQt5.QtCore.QTranslator()
        translator.load("./i18n/zh_CN")
        app.installTranslator(translator)

        context.setContextProperty('dmail', dmail.qmlReceiver)
        engine.load('qml/main.qml')
        # dmail.qmlCaller.set_root_object(engine.rootObjects()[0])
        # dmail.qmlCaller.refresh_keylist()

        app.exec_()
