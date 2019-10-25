VERSION = $(shell git describe --tags --always --dirty)

build:
	docker build -t neuralgpu/neuralgpu:dev .

publish: build
	docker tag neuralgpu/neuralgpu:dev docker2.openai.com/openai/neuralgpu:dev
	docker tag neuralgpu/neuralgpu:dev docker2.openai.com/openai/neuralgpu:${VERSION}
	docker push docker2.openai.com/openai/neuralgpu:dev
	docker push docker2.openai.com/openai/neuralgpu:${VERSION}

run_local: build
	docker run --rm -it neuralgpu/neuralgpu:dev python -u /neural_gpu_trainer.py --nmaps=256 --task=bmul --progressive_curriculum=5
