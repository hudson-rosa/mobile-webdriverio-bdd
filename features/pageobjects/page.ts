import { browser } from '@wdio/globals'
import 'webdriverio';

export default class Page {

    public open (path: string) {
        return browser.url(`https://the-internet.herokuapp.com/${path}`)
    }
}
