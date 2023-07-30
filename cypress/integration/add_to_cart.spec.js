/// <reference types="cypress" />

describe('Jungle app', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('visits homepage', () => {
    
  })

  it("it should click add product and quantity on cart should increase by 1", () => {
    cy.contains('Add').click({ force: true })
    cy.contains('My Cart (1)').should('exist')
      
  });

})