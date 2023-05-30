Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A531B19516
	for <timestamp@lists.linux.dev>; Tue, 30 May 2023 14:49:09 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-514953b3aa6so4188851a12.1
        for <timestamp@lists.linux.dev>; Tue, 30 May 2023 07:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685458148; x=1688050148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDtOZScMEhQcxZ0qCP2mG/VW4cw5TvuSdeS8G5ww6IY=;
        b=QXG1N9nMirFW5x9su+89Sr2YJxHMWbZ7KcizZ5iER13vf1DLIImohOn0evXipGmnBk
         e2KrLr9sWalAqVL9rZdCzITLPKLYpYgTu5KVHeJc2PPYQaoA9PnCswuJSsDJifPlH7Iq
         MivJ36BgLvk8rAGSn63g8E5VzaUbsSVNSzKJ91fAf4BNNBtR85ni5HYHTu8Hy64NX0Hu
         JYoHtS3br90Trzl+YOkYrkIEVZOsfeAOEUi9GLF9Qkrh5i1yR1snbODHovA8Wp66MyEA
         w1yfm3AmfAb6N21GieYTVCoXvRpNXIPyrYul8/w2zEjQ4axkaLtK0wR5uP/h0woXs/gW
         dZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458148; x=1688050148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDtOZScMEhQcxZ0qCP2mG/VW4cw5TvuSdeS8G5ww6IY=;
        b=Hae2kowXP+Kc0C+daOi6wnke+I9S4AOZUAsURhsGTxhwLZ5hh02L5QKsXWE5yI7KYR
         Vx0Yd9BgsTR1xLBp4L2V3BTezmBFTBJOJW3pvhnH5CBXD/kp8ZuSBBfeI59ccBH1X4wU
         omL8cIKkPywmU7h86DcymL4w8tiDUVVM73n6dgM7uxYNo4AKcMdivLAPlAIXPqwLWzVc
         y/FZT7L44XKij9TwsNb1cEXjl88wxmbJJpHcq2gQLHxri0meYiQBRHHN2ZDsEkvaZGEt
         84Zunc0wkSsuuMRWfnFvXVMwOztnCftd7eb7QptUPvgJ1+2R2UBhXmh3P8EyfwxqsA43
         hzhw==
X-Gm-Message-State: AC+VfDwrFdIeI7rQwEdyFNkZIUz3WukSryQjWP/QxxVjYiPjE2R5dMwx
	IDGGEK379FvfcjH+oRA5WC3Ybw==
X-Google-Smtp-Source: ACHHUZ5gmAumXj2b1GIfXBoPyWfnVelqgUTij3Kbup650+F2Nc8xc8UrKiGkys3OMi8/buw0FLqxBg==
X-Received: by 2002:a50:ee04:0:b0:514:90de:423e with SMTP id g4-20020a50ee04000000b0051490de423emr1958340eds.36.1685458147907;
        Tue, 30 May 2023 07:49:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id q21-20020aa7cc15000000b00514b2717ec6sm631283edt.28.2023.05.30.07.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:49:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Dipen Patel <dipenp@nvidia.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Dilip Kota <eswara.kota@linux.intel.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	timestamp@lists.linux.dev,
	linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH 4/7] dt-bindings: slimbus: restrict node name suffixes
Date: Tue, 30 May 2023 16:48:48 +0200
Message-Id: <20230530144851.92059-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: timestamp@lists.linux.dev
List-Id: <timestamp.lists.linux.dev>
List-Subscribe: <mailto:timestamp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:timestamp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the pattern matching node names a bit stricter to improve DTS
consistency.  The pattern is restricted to:
1. Only one unit address or one -N suffix,
2. -N suffixes to decimal numbers.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Tony Lindgren <tony@atomide.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/slimbus/slimbus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/slimbus/slimbus.yaml b/Documentation/devicetree/bindings/slimbus/slimbus.yaml
index 22513fb7c59a..3b8cae9d1016 100644
--- a/Documentation/devicetree/bindings/slimbus/slimbus.yaml
+++ b/Documentation/devicetree/bindings/slimbus/slimbus.yaml
@@ -15,7 +15,7 @@ description:
 
 properties:
   $nodename:
-    pattern: "^slim(@.*|-[0-9a-f])*$"
+    pattern: "^slim(@.*|-([0-9]|[1-9][0-9]+))?$"
 
   "#address-cells":
     const: 2
-- 
2.34.1

