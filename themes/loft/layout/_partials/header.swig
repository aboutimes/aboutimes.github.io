
<div class="site-brand-wrapper">
  <div class="site-meta {% if theme.custom_logo.enabled %}custom-logo{% endif %}">
    {% if theme.custom_logo.image %}
      <div class="site-meta-headline">
        <a href="{{ url_for('/') }}">
          <img class="custom-logo-image" src="/images/logo.png"
               alt="{{ config.title }}"/>
        </a>
      </div>
    {% endif %}
    <span class="description">{{ config.description }}</span>
    <!-- {% if theme.seo %}
      <h1 class="site-subtitle" itemprop="description">{{ config.subtitle }}</h1>
    {% else %}
      <p class="site-subtitle">{{ config.subtitle }}</p>
    {% endif %} -->
  </div>

  <div class="site-nav-toggle">
    <button>
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
    </button>
  </div>
</div>

<nav class="site-nav">
  {% set hasSearch = theme.swiftype_key || theme.algolia_search.enable || theme.tinysou_Key || theme.local_search.enable %}

  {% if theme.menu %}
    <ul id="menu" class="menu">
      {% for name, path in theme.menu %}
        {% set itemName = name.toLowerCase() %}
        <li class="menu-item menu-item-{{ itemName }}" id="menu-{{ itemName }}">
          {% if name=='categories' %}
            <a href="{{ url_for(path) }}">
              {% if theme.menu_icons.enable %}
                <i class="menu-item-icon fa fa-fw fa-{{theme.menu_icons[itemName] | default('question-circle') | lower }}"></i>
              {% endif %}
              {{ __('menu.' + name) }}
              <span class="arrow"></span>
              <ul class="submenu">
              <!-- 分类链接 -->
                {%  for cat in site.categories  %}
                  <li><a href="{{ url_for(cat.path) }}" class="nav-link">{{ cat.name }}</a></li>
                {% endfor %}
              </ul>
            </a>
            
          {% elseif name!='categories' %}
            <a href="{{ url_for(path) }}" rel="section">
              {% if theme.menu_icons.enable %}
                <i class="menu-item-icon fa fa-fw fa-{{theme.menu_icons[itemName] | default('question-circle') | lower }}"></i>
              {% endif %}
              {{ __('menu.' + name) }}
            </a>
          {% endif %}
        </li>
      {% endfor %}
      {% if hasSearch %}
        <li class="menu-item menu-item-search">
          {% if theme.swiftype_key %}
            <a href="javascript:;" class="st-search-show-outputs">
          {% elseif theme.local_search.enable || theme.algolia_search.enable %}
            <a href="javascript:;" class="popup-trigger">
          {% endif %}
            {% if theme.menu_icons.enable %}
              <i class="menu-item-icon fa fa-search fa-fw"></i> <br />
            {% endif %}
            {{ __('menu.search') }}
          </a>
        </li>
      {% endif %}
    </ul>
  {% endif %}

  {% if hasSearch %}
    <div class="site-search">
      {% include 'search.swig' %}
    </div>
  {% endif %}
</nav>


