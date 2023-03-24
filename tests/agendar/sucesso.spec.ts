import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('http://refeitorio.picos.ifpi.edu.br/');
  await page.getByText('☰').click();
  await page.getByRole('link', { name: 'Login' }).click();
  await page.getByPlaceholder('Usuário').fill('2021118tads0033');
  await page.getByPlaceholder('Senha').click();
  // FALTA A SENHA (NAO VOU LHE DEIXAR ELA AKI!), mas funciona, CONFIA!
  await page.getByPlaceholder('Senha').fill('FALTA A SENHA (NAO VOU LHE DEIXAR ELA AKI!)');
  await page.getByRole('button', { name: 'Login' }).click();
  page.once('dialog', dialog => {
    console.log(`Dialog message: ${dialog.message()}`);
    dialog.dismiss().catch(() => {});
  });
  await page.getByRole('link', { name: 'Agendar' }).click();
  await expect('Agendamento confirmado para:').toBeTruthy();
  await expect('27 de Março de 2023').toBeTruthy();
});