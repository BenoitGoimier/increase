<h3>Mes projets {{ nom.getIdentite() }}</h3>

{% for projet in projets %}
    <div class="row">
        <div class="col-md-2">
            {{ projet.getnom() }}
        </div>

        <div class="col-md-6">
            <div class="progress">
                <div class="progress-bar progress-bar-{{ projet.getClass() }} progress-bar-striped" role="progressbar" aria-valuenow="{{ projet.getPercent() }}" aria-valuemin="0" aria-valuemax="100" style="width: {{ projet.getPercent() }}%">
                    {{ projet.getPercent() }}%
                </div>
            </div>
        </div>

        <div class="col-md-2">
            {{ projet.getDayOff() }} jour(s) restant(s)
        </div>

        <div class="col-md-2">
            <a class="btn btn-default form-control" href="../project/{{ projet.getId() }}">Ouvrir</a>
        </div>
    </div>
{% endfor %}