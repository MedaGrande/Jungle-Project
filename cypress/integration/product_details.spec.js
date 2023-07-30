/// <reference types="cypress" />

describe('Jungle app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })

  it('visits homepage', () => {
    
  })

  it("it should click on product and go to product detail", () => {
  cy.contains('Cliff Collard').click()
  });
  
})