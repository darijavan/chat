const electron = require('electron');
const { app, BrowserWindow } = electron;
const path = require('path');
const url = require('url');

app.on('ready', showSplashScreen);

function showSplashScreen() {
    let splash = new BrowserWindow({
        width: 300,
        height: 500,
        center: true,
        show: false
    });

    splash.loadURL(url.format({
        pathname: path.join(__dirname, 'src/html/splash.html'),
        protocol: 'file',
        slashes: true
    }));

    splash.on('ready-to-show', () => {
        splash.show();
        setTimeout(showLogin(splash), 4000);
    });
}

function showLogin(splash) {
    return () => {
        splash.hide();
        let login = new BrowserWindow({
            width: 300,
            height: 500,
            center: true,
            show: false,
            webPreferences: {
                nodeIntegration: true
            }
        });

        login.loadURL(url.format({
            pathname: path.join(__dirname, 'src/html/login.html'),
            protocol: 'file',
            slashes: true
        }));

        login.on('ready-to-show', () => {
            login.show();
            splash.close();
        });
    };
}

