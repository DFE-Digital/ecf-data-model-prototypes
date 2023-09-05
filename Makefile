all: refresh-flat refresh-separate refresh-hierarchical
refresh-separate:
	cd separate && make
refresh-hierarchical:
	cd hierarchical && make
refresh-flat:
	cd flat && make
generate-diagrams:
	mermerd -c postgres://localhost/prototype_flat --schema public --useAllTables --showAllConstraints --outputFileName flat.mmd
	mermerd -c postgres://localhost/prototype_hierarchical --schema public --useAllTables --showAllConstraints --outputFileName hierarchical.mmd
	mermerd -c postgres://localhost/prototype_separate --schema public --useAllTables --showAllConstraints --outputFileName separate.mmd
