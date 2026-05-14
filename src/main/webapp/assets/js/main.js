// Funções utilitárias para o sistema OJJ Acadêmico

// Função para confirmar logout
function confirmLogout() {
    return confirm('Tem certeza que deseja sair do sistema?');
}

// Função para mostrar mensagens temporárias
function showMessage(message, type = 'info') {
    const messageDiv = document.createElement('div');
    messageDiv.className = `message ${type}`;
    messageDiv.textContent = message;

    const container = document.querySelector('.container') || document.body;
    container.insertBefore(messageDiv, container.firstChild);

    setTimeout(() => {
        messageDiv.remove();
    }, 5000);
}

// Função para validar formulários
function validateForm(formId) {
    const form = document.getElementById(formId);
    if (!form) return false;

    const inputs = form.querySelectorAll('input[required]');
    let isValid = true;

    inputs.forEach(input => {
        if (!input.value.trim()) {
            input.classList.add('error');
            isValid = false;
        } else {
            input.classList.remove('error');
        }
    });

    return isValid;
}

// Inicializar funcionalidades quando o DOM estiver carregado
document.addEventListener('DOMContentLoaded', function() {
    // Adicionar confirmação ao logout
    const logoutLinks = document.querySelectorAll('a[href*="logout"]');
    logoutLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            if (!confirmLogout()) {
                e.preventDefault();
            }
        });
    });

    // Adicionar validação aos formulários
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            if (!validateForm(form.id)) {
                e.preventDefault();
                showMessage('Por favor, preencha todos os campos obrigatórios.', 'error');
            }
        });
    });
});