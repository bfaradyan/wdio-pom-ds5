import { Given, When, Then } from '@wdio/cucumber-framework';

import LoginPage from '../pageobjects/login.page.js';
import HomePage from '../pageobjects/home.page.js';

const pages = {
    login: LoginPage
}

Given(/^User on the (\w+) page$/, async (page) => {
    await pages[page].open()
});

When('User login with {string} and {string}', async (username, password) => {
    await LoginPage.login(username, password)
});

Then('User should redirected to home page', async () => {
  await HomePage.homePageValidate()
})

Then('User should see an error message {string}', async (errorMessage) => {
    await LoginPage.wrongCredentialValidate(errorMessage)
});