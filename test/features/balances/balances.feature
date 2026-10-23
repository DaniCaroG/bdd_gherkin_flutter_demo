Feature: Privacidad de los saldos de Nexo
  Los importes son ficticios y la privacidad protege toda la pantalla.

  Scenario: Saldos visibles al abrir la aplicación
    Given the Nexo dashboard is open
    Then the total amount is visible
    And every displayed amount is visible

  Scenario: Ocultar todos los importes
    Given the Nexo dashboard is open
    When I enable balance privacy
    Then every displayed amount is masked
    And the privacy control offers to show balances

  Scenario: Recuperar los importes originales
    Given the Nexo dashboard is open
    When I enable balance privacy
    And I disable balance privacy
    Then every displayed amount is visible
    And the privacy control offers to hide balances

  Scenario: Privacidad de productos y movimientos
    Given the Nexo dashboard is open
    When I enable balance privacy
    Then the total amount is masked
    And product amounts are masked
    And movement amounts are masked
    But the names of products and movements remain visible

  Scenario Outline: Alternar privacidad
    Given the Nexo dashboard is open
    When I set privacy to <mode>
    Then the total amount is <result>

    Examples:
      | mode       | result      |
      | {'hidden'} | {'masked'}  |
      | {'visible'}| {'visible'} |
