import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('http://refeitorio.picos.ifpi.edu.br/accounts/esqueci/');
  await page.locator('#id_matricula').click();
  await page.locator('#id_matricula').fill('2021118tads0000');
  await page.locator('#id_email').click();
  await page.locator('#id_email').fill('agua@agua');
  await page.locator('#id_senha').click();
  await page.locator('#id_senha').fill('12345678');
  await page.getByRole('button', { name: ' Salvar' }).click();
  expect('Informe um endereço de email válido.').toBeTruthy();
});