/// <reference types="cypress" />

describe('Jungle app', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it('visits homepage', () => {
    
  })

  it("There is products on the page", () => {
  cy.get(".products article").should("be.visible");
  });

  it("There are 12 products on the page", () => {
  cy.get(".products article").should("have.length", 12);
});
})