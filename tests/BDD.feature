Feature: Alterar Senha

    Neste exemplo, a funcionalidade é a alteração de senha no sistema e os cenários de
    teste incluem testes de alteração de senha com matrícula e email que não condizem,
    alteração de senha sem inserir matrícula, alteração de senha sem inserir email,
    alteração de senha sem inserir a nova senha e alteração de senha com email inválido.
    Cada cenário começa com um "Dado" que define o estado inicial e, em seguida,
    continua com uma série de "E" (eventos) que descrevem as ações que o usuário realiza.
    Finalmente, cada cenário termina com um "Então" que descreve o resultado esperado.
    O BDD é uma metodologia de teste de software que visa tornar as
    especificações de software mais legíveis e compreensíveis para as partes interessadas,
    permitindo que elas participem ativamente do processo de desenvolvimento.

    Scenario: Alteração de senha com matrícula e email que não condizem
        Given QUE o email e a matrícula não condizem
        When tento alterar a senha
        Then é emitido uma mensagem dizendo que os dados não conferem.
        
    Scenario: Alteração de senha sem inserir e-mail
        Given DADO QUE não preencho o campo de e-mail
        And insiro minha matrícula válida
        And insiro uma nova senha válida
        When tento alterar a senha
        Then é emitido uma mensagem dizendo que o campo e-mail é obrigatório.

    Scenario: Alteração de senha sem inserir matrícula
        Given não preencho o campo de matrícula
        And insiro meu e-mail válido
        And insiro uma nova senha válida
        When tento alterar a senha
        Then é emitido uma mensagem dizendo que o campo matrícula é obrigatório.

    Scenario: Alteração de senha sem inserir a nova senha
        Given não preencho o campo de nova senha
        And insiro meu email válido
        And insiro minha matrícula válida
        When tento alterar a senha
        Then é emitido uma mensagem dizendo que o campo nova senha é obrigatório.

    Scenario: Alteração de senha com e-mail inválido
        Given insiro minha matrícula válida
        And insiro meu email inválido
        And insiro uma nova senha válida
        When tento alterar a senha
        Then é emitido uma mensagem dizendo que o endereço de e-mail têm que ser válido.

Feature: Agendar

    Neste exemplo, a funcionalidade é a de agendar a
    refeição e os cenários de teste incluem o agendamento
    com sucesso e tentar agendar já estando agendado.

    Scenario: Agendamento com sucesso
        Given não agendei a refeição ainda
        And estou dentro do horário de agendamento (que é das 20h às 2h)
        When tento agendar a refeição
        Then o sistema agenda minha refeição
        And diminui o número de vagas restantes

    Scenario: Tentar agendar já estando agendado
        Given já agendei a refeição
        When tento agendar novamente
        Then o sistema não permite o segundo agendamento do mesmo usuário

Feature: Alterar foto de perfil

    Neste exemplo, a funcionalidade é a de alterar a foto do perfil
    e os cenários de teste incluem o tentar alterar sem colocar a nova
    foto e tentar alterar a foto do perfil por um arquivo de extensão .PDF.

    Scenario: Alterar a foto do perfil sem colocar a nova foto
        Given não coloco o novo arquivo para ser salvo
        When tento alterar a foto de perfil
        Then o sistema desconsidera a alteração
        And mantém a foto atual

    Scenario: Alterar a foto do perfil por um arquivo de extensão .PDF
        Given faço o anexo de um arquivo de extensão PDF
        When tento alterar a foto
        Then o sistema desconsidera a alteração
        And mantém a foto atual
