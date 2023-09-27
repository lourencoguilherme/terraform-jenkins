class LoginPage {

    go() {
        cy.visit('https://docket-platform-auth-homol.docket.com.br/login')
        cy.get('img[alt="docket"]').should('be.visible')
        cy.contains('h4', 'Bem vindo de volta').should('be.visible')
        cy.contains('p', 'Digite suas credenciais para acessar sua conta').should('be.visible')
        cy.contains('label', 'Email').should('be.visible')
        cy.contains('label', 'Senha').should('be.visible')
        cy.contains('button', 'Esqueci minha senha').should('be.visible')
        cy.get('.sc-ipMvLY.isHOGr').should('have.text', 'Problemas com seu login?Fale com suporte')
        cy.contains('p', '© 2023 Docket • All Rights reserverd').should('be.visible')
    }

    fill(user) {
        cy.get('input[name$="userEmail"]').clear({ force: true }).as('email')
        cy.get('input[name$="password"]').clear({ force: true }).as('password')

        if (user.email) {
            cy.get('@email').type(user.email)
        } else if (user.username) {
            cy.get('@email').type(user.username)
        } else {
            cy.log('empty login')
        }

        user.password ? cy.get('@password').type(user.password) : cy.log('empyt pass')
    }

    submit() {
        cy.contains('button', 'Entrar').click()
    }

    doLogin(user) {
        this.go()
        this.fill(user)
        this.submit()
    }

    haveText(element, text) {
        cy.get(element)
            .should('be.visible')
            .should('have.text', text)
    }
}

export default new LoginPage()