import user from '../fixtures/users.json'
import loginPage from '../support/pages/LoginPage'

describe('Login', () => {
  it('deve logar com email cadastrado', () => {
    loginPage.doLogin(user.valid_user_email)
  })

  it('deve logar com username cadastrado', () => {
    loginPage.doLogin(user.valid_user)
  })

  it('não deve logar com email cadastrado e senha incorreta', () => {
    loginPage.doLogin(user.invalid_pwd_email)
    loginPage.haveText('.sc-ipMvLY.lkPhfD', 'Usuário ou senha incorretos.')
  })

  it('não deve logar com username cadastrado e senha incorreta', () => {
    loginPage.doLogin(user.invalid_pwd)
    loginPage.haveText('.sc-ipMvLY.lkPhfD', 'Usuário ou senha incorretos.')
  })

  it('não deve logar com email cadastrado e senha em branco', () => {
    loginPage.doLogin(user.empty_pwd_email)
    cy.validateInvokeMessage('input[name$="password"]', 'Please fill out this field.')
  })

  it('não deve logar com username cadastrado e senha em branco', () => {
    loginPage.doLogin(user.empty_pwd)
    cy.validateInvokeMessage('input[name$="password"]', 'Please fill out this field.')
  })

  it('não deve logar com senha cadastrada no banco e username em branco', () => {
    loginPage.doLogin(user.empty_username)
    cy.validateInvokeMessage('input[name$="userEmail"]', 'Please fill out this field.')
  })

  it('não deve logar com campos em branco', () => {
    loginPage.doLogin(user.empty_user)
    cy.validateInvokeMessage('input[name$="userEmail"]', 'Please fill out this field.')
  })

  it('não deve logar com emails incorretos', () => {
    const emails = user.invalid_emails

    loginPage.go()
    emails.forEach((u) => {
      loginPage.fill(u)
      loginPage.submit()
      cy.wait(500)
      loginPage.haveText('.sc-ipMvLY.lkPhfD', 'Usuário ou senha incorretos.')
    })
  })

  
  it('não deve logar com username não cadastrado e senha existente no banco', () => {
    loginPage.doLogin(user.username_not_found)
    loginPage.haveText('.sc-ipMvLY.lkPhfD', 'Usuário ou senha incorretos.')
  })

  it('não deve logar com email não cadastrado e senha existente no banco', () => {
    loginPage.doLogin(user.email_not_found)
    loginPage.haveText('.sc-ipMvLY.lkPhfD', 'Usuário ou senha incorretos.')
  })
  
  it('não deve logar com email e senha não cadastrados', () => {
    loginPage.doLogin(user.user_not_found_email)
    loginPage.haveText('.sc-ipMvLY.lkPhfD', 'Usuário ou senha incorretos.')
  })
  
  it('não deve logar com username e senha não cadastrados', () => {
    loginPage.doLogin(user.user_not_found)
    loginPage.haveText('.sc-ipMvLY.lkPhfD', 'Usuário ou senha incorretos.')
  })
  
  // --------- CENÁRIO COM ERRO -----------
  it.skip('não deve logar com usernames incorretos', () => {
    const usernames = user.invalid_usernames

    loginPage.go()
    usernames.forEach((u) => {
      loginPage.fill(u)
      loginPage.submit()
      cy.wait(500)
      loginPage.haveText('.sc-ipMvLY.lkPhfD', 'Usuário ou senha incorretos.')
    })
  })
})