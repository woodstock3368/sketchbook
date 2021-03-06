/*
 * © 2021 by Intellectual Reserve, Inc. All rights reserved.
 */
package io.github.drautb;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static net.logstash.logback.argument.StructuredArguments.keyValue;

public class Application {

  private static final Logger LOG = LoggerFactory.getLogger(Application.class);

  public static void main(String[] args) throws Exception {
    final String pathToData = args[0];
    final String pathToRecordStuff = args[1];
    LOG.info("Starting principal analysis",
        keyValue("pathToData", pathToData),
        keyValue("pathToRecordStuff", pathToRecordStuff));

    new DataGatherer().reap(pathToData, pathToRecordStuff);
  }

}
