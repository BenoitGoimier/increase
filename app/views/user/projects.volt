<h3>Mes projets {{ nom.identite }}</h3>

{% for projet in projets %}
    <div class="progress">
        <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
            <span class="sr-only">40% Complete (success)</span>
        </div>
    </div>
    {{ projet.getnom() }}
{% endfor %}