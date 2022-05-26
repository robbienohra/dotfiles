cd ~/code/my.clearbanc.com

shopt -s expand_aliases

sed -i 's/collectCoverage: true/collectCoverage: false/g' jest.config.js
git apply ~/Downloads/comp.diff;
git apply ~/Downloads/jest.diff;
rg "\.destroy\(\)" -g '*.spec.js' -l | xargs sed -i 's/.destroy()/.unmount()/g'

rg "localVue," -g '*.spec.js' -l | xargs sed -i '/localVue,$/d'; \
rg "localVue," -g '*.spec.js' -l | xargs sed -i 's/localVue,//g'; \
rg "\{ localVue \}" -g '*.spec.js' -l | xargs sed -i '/localVue,$/d'; \
rg "const localVue" -l | xargs sed -i '/const localVue/d'; \
rg "import \{ createLocalVue \}" -l | xargs sed -i '/import { createLocalVue }/d'; \
rg "import \{ localVue \}" -l | xargs sed -i '/import { localVue }/d'; \
rg "propsData" -g '*.spec.js' -l | xargs sed -i 's/propsData/props/g'

rg "new VueRouter" -g '*.spec.js'  -l | xargs sed -i "1 i\ import { createRouter, createWebHistory } from 'vue-router'"; \
rg "new VueRouter" -g '*.spec.js'  -l | xargs sed -i "/new VueRouter/a history: createWebHistory(),";
rg "new VueRouter" -g '*.spec.js'  -l | xargs sed -i "s/new VueRouter/createRouter/g"; \
rg "import VueRouter" -g '*.spec.js' -l | xargs sed -i "/import VueRouter/d";

rg "new Vuex.Store" -g '*.spec.js' -l | xargs sed -i "1 i\ import { createStore } from 'vuex'"; \
rg "new Vuex.Store" -g '*.spec.js' -l | xargs sed -i "s/new Vuex.Store/createStore/g"; \
rg "import Vuex" -g '*.spec.js' -l | xargs sed -i "/import Vuex/d"; \
rg "Vue.use\(Vuex\)" -g '*.spec.js' -l | xargs sed -i "/Vue.use(Vuex)/d"; \
rg "import Vue from" -g '*.spec.js' -l | xargs sed -i "/import Vue/d"; 

rg "new Store" -g '*.spec.js' -l | xargs sed -i "1 i\ import { createStore } from 'vuex'"; \
rg "new Store" -g '*.spec.js' -l | xargs sed -i "s/new Store/createStore/g"; \
rg "import \{ Store \}" -g '*.spec.js' -l | xargs sed -i "/import { Store }/d";
