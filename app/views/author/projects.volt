<h3>Mes projets {{ nom.getIdentite() }}</h3>

{% for projet in projets %}
    <div class="row">
        <div class="col-md-2">
            {{ projet.nom }}
        </div>

        <div class="col-md-6">
            <div class="progress">
                <div class="progress-bar progress-bar-{{ class[projet.id] }} progress-bar-striped" role="progressbar" aria-valuenow="{{ percent[projet.id] }}" aria-valuemin="0" aria-valuemax="100" style="width: {{ percent[projet.id] }}%">
                    {{ percent[projet.id] }}%
                </div>
            </div>
        </div>

        <div class="col-md-2">
            {{ dayOff[projet.id] }} jour(s) restant(s)
        </div>

        <div class="col-md-2">
            <a class="btn btn-default form-control" href="../project/{{ projet.id }}/{{ nom.getId() }}">Ouvrir</a>
        </div>
    </div>
{% endfor %}
