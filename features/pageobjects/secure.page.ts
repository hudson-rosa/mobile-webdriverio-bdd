import { $ } from '@wdio/globals'
import Page from './page';

class SecurePage extends Page {

    public get flashAlert () {
        return $('#flash');
    }
}

export default new SecurePage();
