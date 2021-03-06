package com.longlian.live.util.guava;

import java.util.concurrent.Executors;

/***
 * 
 * @author gaoqi3 2018.03.05
 *
 */

final class FConfig {

	static class SingletonHolder {
		final static F.Executor defExecutor = F
				.generate(Executors.newFixedThreadPool(Runtime.getRuntime().availableProcessors()));

		SingletonHolder() {
			Runtime.getRuntime().addShutdownHook(new Thread(new Runnable() {
				@Override
				public void run() {
					defExecutor.shutdown();
				}
			}));
		}

	}

	FConfig() {

	}

	static final F.Executor getDefExecutor() {
		return SingletonHolder.defExecutor;
	}

}
