all: refresh-flat refresh-separate refresh-hierarchical
refresh-separate:
	cd separate && make
refresh-hierarchical:
	cd hierarchical && make
refresh-flat:
	cd flat && make
